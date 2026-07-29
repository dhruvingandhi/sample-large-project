# Explore: explore_3487
# Auto-generated LookML Explore File

include: "/views/domain_12/view_10462.view.lkml"
include: "/views/domain_14/view_10464.view.lkml"
include: "/views/domain_15/view_10465.view.lkml"
include: "/views/domain_16/view_10466.view.lkml"

explore: explore_3487 {
  label: "Explore Explore 3487"
  description: "Comprehensive analytics explore joining base view_10462 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10462
  
  always_filter: {
    filters: [view_10462.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10462.created_at_date: "7 days"]
    unless: [view_10462.id, view_10462.status]
  }

  join: view_10464 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10462.user_id} = ${view_10464.id} ;;
    required_joins: []
  }

  join: view_10465 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10462.account_id} = ${view_10465.account_id} ;;
    required_joins: [view_10464]
  }

  join: view_10466 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10462.category} = ${view_10466.category} ;;
  }

  access_filter: {
    field: view_10462.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10462.is_deleted} = false ;;
}
