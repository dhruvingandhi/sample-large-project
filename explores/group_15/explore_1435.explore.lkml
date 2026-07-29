# Explore: explore_1435
# Auto-generated LookML Explore File

include: "/views/domain_06/view_04306.view.lkml"
include: "/views/domain_08/view_04308.view.lkml"
include: "/views/domain_09/view_04309.view.lkml"
include: "/views/domain_10/view_04310.view.lkml"

explore: explore_1435 {
  label: "Explore Explore 1435"
  description: "Comprehensive analytics explore joining base view_04306 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04306
  
  always_filter: {
    filters: [view_04306.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04306.created_at_date: "7 days"]
    unless: [view_04306.id, view_04306.status]
  }

  join: view_04308 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04306.user_id} = ${view_04308.id} ;;
    required_joins: []
  }

  join: view_04309 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04306.account_id} = ${view_04309.account_id} ;;
    required_joins: [view_04308]
  }

  join: view_04310 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04306.category} = ${view_04310.category} ;;
  }

  access_filter: {
    field: view_04306.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04306.is_deleted} = false ;;
}
