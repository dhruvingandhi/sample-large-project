# Update for 2000 file diff target
# Explore: explore_0939
# Auto-generated LookML Explore File

include: "/views/domain_18/view_02818.view.lkml"
include: "/views/domain_20/view_02820.view.lkml"
include: "/views/domain_21/view_02821.view.lkml"
include: "/views/domain_22/view_02822.view.lkml"

explore: explore_0939 {
  label: "Explore Explore 0939"
  description: "Comprehensive analytics explore joining base view_02818 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_02818
  
  always_filter: {
    filters: [view_02818.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02818.created_at_date: "7 days"]
    unless: [view_02818.id, view_02818.status]
  }

  join: view_02820 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02818.user_id} = ${view_02820.id} ;;
    required_joins: []
  }

  join: view_02821 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02818.account_id} = ${view_02821.account_id} ;;
    required_joins: [view_02820]
  }

  join: view_02822 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02818.category} = ${view_02822.category} ;;
  }

  access_filter: {
    field: view_02818.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02818.is_deleted} = false ;;
}
