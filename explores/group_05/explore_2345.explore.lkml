# Explore: explore_2345
# Auto-generated LookML Explore File

include: "/views/domain_36/view_07036.view.lkml"
include: "/views/domain_38/view_07038.view.lkml"
include: "/views/domain_39/view_07039.view.lkml"
include: "/views/domain_40/view_07040.view.lkml"

explore: explore_2345 {
  label: "Explore Explore 2345"
  description: "Comprehensive analytics explore joining base view_07036 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07036
  
  always_filter: {
    filters: [view_07036.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07036.created_at_date: "7 days"]
    unless: [view_07036.id, view_07036.status]
  }

  join: view_07038 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07036.user_id} = ${view_07038.id} ;;
    required_joins: []
  }

  join: view_07039 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07036.account_id} = ${view_07039.account_id} ;;
    required_joins: [view_07038]
  }

  join: view_07040 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07036.category} = ${view_07040.category} ;;
  }

  access_filter: {
    field: view_07036.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07036.is_deleted} = false ;;
}
