# Update for 2000 file diff target
# Explore: explore_2939
# Auto-generated LookML Explore File

include: "/views/domain_18/view_08818.view.lkml"
include: "/views/domain_20/view_08820.view.lkml"
include: "/views/domain_21/view_08821.view.lkml"
include: "/views/domain_22/view_08822.view.lkml"

explore: explore_2939 {
  label: "Explore Explore 2939"
  description: "Comprehensive analytics explore joining base view_08818 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08818
  
  always_filter: {
    filters: [view_08818.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08818.created_at_date: "7 days"]
    unless: [view_08818.id, view_08818.status]
  }

  join: view_08820 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08818.user_id} = ${view_08820.id} ;;
    required_joins: []
  }

  join: view_08821 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08818.account_id} = ${view_08821.account_id} ;;
    required_joins: [view_08820]
  }

  join: view_08822 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08818.category} = ${view_08822.category} ;;
  }

  access_filter: {
    field: view_08818.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08818.is_deleted} = false ;;
}
