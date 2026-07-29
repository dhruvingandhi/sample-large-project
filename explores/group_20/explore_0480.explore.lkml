# Explore: explore_0480
# Auto-generated LookML Explore File

include: "/views/domain_41/view_01441.view.lkml"
include: "/views/domain_43/view_01443.view.lkml"
include: "/views/domain_44/view_01444.view.lkml"
include: "/views/domain_45/view_01445.view.lkml"

explore: explore_0480 {
  label: "Explore Explore 0480"
  description: "Comprehensive analytics explore joining base view_01441 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01441
  
  always_filter: {
    filters: [view_01441.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01441.created_at_date: "7 days"]
    unless: [view_01441.id, view_01441.status]
  }

  join: view_01443 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01441.user_id} = ${view_01443.id} ;;
    required_joins: []
  }

  join: view_01444 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01441.account_id} = ${view_01444.account_id} ;;
    required_joins: [view_01443]
  }

  join: view_01445 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01441.category} = ${view_01445.category} ;;
  }

  access_filter: {
    field: view_01441.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01441.is_deleted} = false ;;
}
