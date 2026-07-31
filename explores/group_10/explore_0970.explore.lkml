# Update for 2000 file diff target
# Explore: explore_0970
# Auto-generated LookML Explore File

include: "/views/domain_11/view_02911.view.lkml"
include: "/views/domain_13/view_02913.view.lkml"
include: "/views/domain_14/view_02914.view.lkml"
include: "/views/domain_15/view_02915.view.lkml"

explore: explore_0970 {
  label: "Explore Explore 0970"
  description: "Comprehensive analytics explore joining base view_02911 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02911
  
  always_filter: {
    filters: [view_02911.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02911.created_at_date: "7 days"]
    unless: [view_02911.id, view_02911.status]
  }

  join: view_02913 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02911.user_id} = ${view_02913.id} ;;
    required_joins: []
  }

  join: view_02914 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02911.account_id} = ${view_02914.account_id} ;;
    required_joins: [view_02913]
  }

  join: view_02915 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02911.category} = ${view_02915.category} ;;
  }

  access_filter: {
    field: view_02911.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02911.is_deleted} = false ;;
}
