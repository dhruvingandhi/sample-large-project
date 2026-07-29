# Explore: explore_1199
# Auto-generated LookML Explore File

include: "/views/domain_48/view_03598.view.lkml"
include: "/views/domain_50/view_03600.view.lkml"
include: "/views/domain_01/view_03601.view.lkml"
include: "/views/domain_02/view_03602.view.lkml"

explore: explore_1199 {
  label: "Explore Explore 1199"
  description: "Comprehensive analytics explore joining base view_03598 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03598
  
  always_filter: {
    filters: [view_03598.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03598.created_at_date: "7 days"]
    unless: [view_03598.id, view_03598.status]
  }

  join: view_03600 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03598.user_id} = ${view_03600.id} ;;
    required_joins: []
  }

  join: view_03601 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03598.account_id} = ${view_03601.account_id} ;;
    required_joins: [view_03600]
  }

  join: view_03602 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03598.category} = ${view_03602.category} ;;
  }

  access_filter: {
    field: view_03598.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03598.is_deleted} = false ;;
}
