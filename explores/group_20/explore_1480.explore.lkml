# Explore: explore_1480
# Auto-generated LookML Explore File

include: "/views/domain_41/view_04441.view.lkml"
include: "/views/domain_43/view_04443.view.lkml"
include: "/views/domain_44/view_04444.view.lkml"
include: "/views/domain_45/view_04445.view.lkml"

explore: explore_1480 {
  label: "Explore Explore 1480"
  description: "Comprehensive analytics explore joining base view_04441 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04441
  
  always_filter: {
    filters: [view_04441.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04441.created_at_date: "7 days"]
    unless: [view_04441.id, view_04441.status]
  }

  join: view_04443 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04441.user_id} = ${view_04443.id} ;;
    required_joins: []
  }

  join: view_04444 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04441.account_id} = ${view_04444.account_id} ;;
    required_joins: [view_04443]
  }

  join: view_04445 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04441.category} = ${view_04445.category} ;;
  }

  access_filter: {
    field: view_04441.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04441.is_deleted} = false ;;
}
