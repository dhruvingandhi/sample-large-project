# Update for 2000 file diff target
# Explore: explore_3939
# Auto-generated LookML Explore File

include: "/views/domain_18/view_11818.view.lkml"
include: "/views/domain_20/view_11820.view.lkml"
include: "/views/domain_21/view_11821.view.lkml"
include: "/views/domain_22/view_11822.view.lkml"

explore: explore_3939 {
  label: "Explore Explore 3939"
  description: "Comprehensive analytics explore joining base view_11818 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11818
  
  always_filter: {
    filters: [view_11818.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11818.created_at_date: "7 days"]
    unless: [view_11818.id, view_11818.status]
  }

  join: view_11820 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11818.user_id} = ${view_11820.id} ;;
    required_joins: []
  }

  join: view_11821 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11818.account_id} = ${view_11821.account_id} ;;
    required_joins: [view_11820]
  }

  join: view_11822 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11818.category} = ${view_11822.category} ;;
  }

  access_filter: {
    field: view_11818.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11818.is_deleted} = false ;;
}
