# Update for 500 file diff target
# Explore: explore_3645
# Auto-generated LookML Explore File

include: "/views/domain_36/view_10936.view.lkml"
include: "/views/domain_38/view_10938.view.lkml"
include: "/views/domain_39/view_10939.view.lkml"
include: "/views/domain_40/view_10940.view.lkml"

explore: explore_3645 {
  label: "Explore Explore 3645"
  description: "Comprehensive analytics explore joining base view_10936 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10936
  
  always_filter: {
    filters: [view_10936.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10936.created_at_date: "7 days"]
    unless: [view_10936.id, view_10936.status]
  }

  join: view_10938 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10936.user_id} = ${view_10938.id} ;;
    required_joins: []
  }

  join: view_10939 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10936.account_id} = ${view_10939.account_id} ;;
    required_joins: [view_10938]
  }

  join: view_10940 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10936.category} = ${view_10940.category} ;;
  }

  access_filter: {
    field: view_10936.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10936.is_deleted} = false ;;
}
