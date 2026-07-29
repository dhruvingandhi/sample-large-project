# Explore: explore_1015
# Auto-generated LookML Explore File

include: "/views/domain_46/view_03046.view.lkml"
include: "/views/domain_48/view_03048.view.lkml"
include: "/views/domain_49/view_03049.view.lkml"
include: "/views/domain_50/view_03050.view.lkml"

explore: explore_1015 {
  label: "Explore Explore 1015"
  description: "Comprehensive analytics explore joining base view_03046 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03046
  
  always_filter: {
    filters: [view_03046.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03046.created_at_date: "7 days"]
    unless: [view_03046.id, view_03046.status]
  }

  join: view_03048 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03046.user_id} = ${view_03048.id} ;;
    required_joins: []
  }

  join: view_03049 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03046.account_id} = ${view_03049.account_id} ;;
    required_joins: [view_03048]
  }

  join: view_03050 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03046.category} = ${view_03050.category} ;;
  }

  access_filter: {
    field: view_03046.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03046.is_deleted} = false ;;
}
