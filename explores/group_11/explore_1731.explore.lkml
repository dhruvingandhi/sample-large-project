# Explore: explore_1731
# Auto-generated LookML Explore File

include: "/views/domain_44/view_05194.view.lkml"
include: "/views/domain_46/view_05196.view.lkml"
include: "/views/domain_47/view_05197.view.lkml"
include: "/views/domain_48/view_05198.view.lkml"

explore: explore_1731 {
  label: "Explore Explore 1731"
  description: "Comprehensive analytics explore joining base view_05194 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05194
  
  always_filter: {
    filters: [view_05194.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05194.created_at_date: "7 days"]
    unless: [view_05194.id, view_05194.status]
  }

  join: view_05196 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05194.user_id} = ${view_05196.id} ;;
    required_joins: []
  }

  join: view_05197 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05194.account_id} = ${view_05197.account_id} ;;
    required_joins: [view_05196]
  }

  join: view_05198 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05194.category} = ${view_05198.category} ;;
  }

  access_filter: {
    field: view_05194.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05194.is_deleted} = false ;;
}
