# Explore: explore_3050
# Auto-generated LookML Explore File

include: "/views/domain_01/view_09151.view.lkml"
include: "/views/domain_03/view_09153.view.lkml"
include: "/views/domain_04/view_09154.view.lkml"
include: "/views/domain_05/view_09155.view.lkml"

explore: explore_3050 {
  label: "Explore Explore 3050"
  description: "Comprehensive analytics explore joining base view_09151 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09151
  
  always_filter: {
    filters: [view_09151.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09151.created_at_date: "7 days"]
    unless: [view_09151.id, view_09151.status]
  }

  join: view_09153 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09151.user_id} = ${view_09153.id} ;;
    required_joins: []
  }

  join: view_09154 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09151.account_id} = ${view_09154.account_id} ;;
    required_joins: [view_09153]
  }

  join: view_09155 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09151.category} = ${view_09155.category} ;;
  }

  access_filter: {
    field: view_09151.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09151.is_deleted} = false ;;
}
