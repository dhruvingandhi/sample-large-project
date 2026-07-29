# Explore: explore_3227
# Auto-generated LookML Explore File

include: "/views/domain_32/view_09682.view.lkml"
include: "/views/domain_34/view_09684.view.lkml"
include: "/views/domain_35/view_09685.view.lkml"
include: "/views/domain_36/view_09686.view.lkml"

explore: explore_3227 {
  label: "Explore Explore 3227"
  description: "Comprehensive analytics explore joining base view_09682 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09682
  
  always_filter: {
    filters: [view_09682.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09682.created_at_date: "7 days"]
    unless: [view_09682.id, view_09682.status]
  }

  join: view_09684 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09682.user_id} = ${view_09684.id} ;;
    required_joins: []
  }

  join: view_09685 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09682.account_id} = ${view_09685.account_id} ;;
    required_joins: [view_09684]
  }

  join: view_09686 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09682.category} = ${view_09686.category} ;;
  }

  access_filter: {
    field: view_09682.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09682.is_deleted} = false ;;
}
