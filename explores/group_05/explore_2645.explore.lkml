# Update for 500 file diff target
# Explore: explore_2645
# Auto-generated LookML Explore File

include: "/views/domain_36/view_07936.view.lkml"
include: "/views/domain_38/view_07938.view.lkml"
include: "/views/domain_39/view_07939.view.lkml"
include: "/views/domain_40/view_07940.view.lkml"

explore: explore_2645 {
  label: "Explore Explore 2645"
  description: "Comprehensive analytics explore joining base view_07936 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07936
  
  always_filter: {
    filters: [view_07936.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07936.created_at_date: "7 days"]
    unless: [view_07936.id, view_07936.status]
  }

  join: view_07938 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07936.user_id} = ${view_07938.id} ;;
    required_joins: []
  }

  join: view_07939 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07936.account_id} = ${view_07939.account_id} ;;
    required_joins: [view_07938]
  }

  join: view_07940 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07936.category} = ${view_07940.category} ;;
  }

  access_filter: {
    field: view_07936.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07936.is_deleted} = false ;;
}
