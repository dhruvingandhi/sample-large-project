# Explore: explore_0057
# Auto-generated LookML Explore File

include: "/views/domain_22/view_00172.view.lkml"
include: "/views/domain_24/view_00174.view.lkml"
include: "/views/domain_25/view_00175.view.lkml"
include: "/views/domain_26/view_00176.view.lkml"

explore: explore_0057 {
  label: "Explore Explore 0057"
  description: "Comprehensive analytics explore joining base view_00172 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00172
  
  always_filter: {
    filters: [view_00172.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00172.created_at_date: "7 days"]
    unless: [view_00172.id, view_00172.status]
  }

  join: view_00174 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00172.user_id} = ${view_00174.id} ;;
    required_joins: []
  }

  join: view_00175 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00172.account_id} = ${view_00175.account_id} ;;
    required_joins: [view_00174]
  }

  join: view_00176 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00172.category} = ${view_00176.category} ;;
  }

  access_filter: {
    field: view_00172.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00172.is_deleted} = false ;;
}
