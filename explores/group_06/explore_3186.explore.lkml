# Explore: explore_3186
# Auto-generated LookML Explore File

include: "/views/domain_09/view_09559.view.lkml"
include: "/views/domain_11/view_09561.view.lkml"
include: "/views/domain_12/view_09562.view.lkml"
include: "/views/domain_13/view_09563.view.lkml"

explore: explore_3186 {
  label: "Explore Explore 3186"
  description: "Comprehensive analytics explore joining base view_09559 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09559
  
  always_filter: {
    filters: [view_09559.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09559.created_at_date: "7 days"]
    unless: [view_09559.id, view_09559.status]
  }

  join: view_09561 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09559.user_id} = ${view_09561.id} ;;
    required_joins: []
  }

  join: view_09562 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09559.account_id} = ${view_09562.account_id} ;;
    required_joins: [view_09561]
  }

  join: view_09563 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09559.category} = ${view_09563.category} ;;
  }

  access_filter: {
    field: view_09559.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09559.is_deleted} = false ;;
}
