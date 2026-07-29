# Explore: explore_0313
# Auto-generated LookML Explore File

include: "/views/domain_40/view_00940.view.lkml"
include: "/views/domain_42/view_00942.view.lkml"
include: "/views/domain_43/view_00943.view.lkml"
include: "/views/domain_44/view_00944.view.lkml"

explore: explore_0313 {
  label: "Explore Explore 0313"
  description: "Comprehensive analytics explore joining base view_00940 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_00940
  
  always_filter: {
    filters: [view_00940.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00940.created_at_date: "7 days"]
    unless: [view_00940.id, view_00940.status]
  }

  join: view_00942 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00940.user_id} = ${view_00942.id} ;;
    required_joins: []
  }

  join: view_00943 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00940.account_id} = ${view_00943.account_id} ;;
    required_joins: [view_00942]
  }

  join: view_00944 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00940.category} = ${view_00944.category} ;;
  }

  access_filter: {
    field: view_00940.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00940.is_deleted} = false ;;
}
