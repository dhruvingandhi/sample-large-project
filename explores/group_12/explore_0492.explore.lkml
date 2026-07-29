# Explore: explore_0492
# Auto-generated LookML Explore File

include: "/views/domain_27/view_01477.view.lkml"
include: "/views/domain_29/view_01479.view.lkml"
include: "/views/domain_30/view_01480.view.lkml"
include: "/views/domain_31/view_01481.view.lkml"

explore: explore_0492 {
  label: "Explore Explore 0492"
  description: "Comprehensive analytics explore joining base view_01477 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_01477
  
  always_filter: {
    filters: [view_01477.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01477.created_at_date: "7 days"]
    unless: [view_01477.id, view_01477.status]
  }

  join: view_01479 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01477.user_id} = ${view_01479.id} ;;
    required_joins: []
  }

  join: view_01480 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01477.account_id} = ${view_01480.account_id} ;;
    required_joins: [view_01479]
  }

  join: view_01481 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01477.category} = ${view_01481.category} ;;
  }

  access_filter: {
    field: view_01477.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01477.is_deleted} = false ;;
}
