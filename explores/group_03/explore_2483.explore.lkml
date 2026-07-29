# Explore: explore_2483
# Auto-generated LookML Explore File

include: "/views/domain_50/view_07450.view.lkml"
include: "/views/domain_02/view_07452.view.lkml"
include: "/views/domain_03/view_07453.view.lkml"
include: "/views/domain_04/view_07454.view.lkml"

explore: explore_2483 {
  label: "Explore Explore 2483"
  description: "Comprehensive analytics explore joining base view_07450 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_07450
  
  always_filter: {
    filters: [view_07450.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07450.created_at_date: "7 days"]
    unless: [view_07450.id, view_07450.status]
  }

  join: view_07452 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07450.user_id} = ${view_07452.id} ;;
    required_joins: []
  }

  join: view_07453 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07450.account_id} = ${view_07453.account_id} ;;
    required_joins: [view_07452]
  }

  join: view_07454 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07450.category} = ${view_07454.category} ;;
  }

  access_filter: {
    field: view_07450.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07450.is_deleted} = false ;;
}
