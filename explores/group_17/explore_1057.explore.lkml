# Explore: explore_1057
# Auto-generated LookML Explore File

include: "/views/domain_22/view_03172.view.lkml"
include: "/views/domain_24/view_03174.view.lkml"
include: "/views/domain_25/view_03175.view.lkml"
include: "/views/domain_26/view_03176.view.lkml"

explore: explore_1057 {
  label: "Explore Explore 1057"
  description: "Comprehensive analytics explore joining base view_03172 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03172
  
  always_filter: {
    filters: [view_03172.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03172.created_at_date: "7 days"]
    unless: [view_03172.id, view_03172.status]
  }

  join: view_03174 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03172.user_id} = ${view_03174.id} ;;
    required_joins: []
  }

  join: view_03175 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03172.account_id} = ${view_03175.account_id} ;;
    required_joins: [view_03174]
  }

  join: view_03176 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03172.category} = ${view_03176.category} ;;
  }

  access_filter: {
    field: view_03172.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03172.is_deleted} = false ;;
}
