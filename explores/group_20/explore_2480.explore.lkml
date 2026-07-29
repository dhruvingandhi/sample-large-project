# Explore: explore_2480
# Auto-generated LookML Explore File

include: "/views/domain_41/view_07441.view.lkml"
include: "/views/domain_43/view_07443.view.lkml"
include: "/views/domain_44/view_07444.view.lkml"
include: "/views/domain_45/view_07445.view.lkml"

explore: explore_2480 {
  label: "Explore Explore 2480"
  description: "Comprehensive analytics explore joining base view_07441 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07441
  
  always_filter: {
    filters: [view_07441.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07441.created_at_date: "7 days"]
    unless: [view_07441.id, view_07441.status]
  }

  join: view_07443 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07441.user_id} = ${view_07443.id} ;;
    required_joins: []
  }

  join: view_07444 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07441.account_id} = ${view_07444.account_id} ;;
    required_joins: [view_07443]
  }

  join: view_07445 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07441.category} = ${view_07445.category} ;;
  }

  access_filter: {
    field: view_07441.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07441.is_deleted} = false ;;
}
