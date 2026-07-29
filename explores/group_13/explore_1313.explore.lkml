# Explore: explore_1313
# Auto-generated LookML Explore File

include: "/views/domain_40/view_03940.view.lkml"
include: "/views/domain_42/view_03942.view.lkml"
include: "/views/domain_43/view_03943.view.lkml"
include: "/views/domain_44/view_03944.view.lkml"

explore: explore_1313 {
  label: "Explore Explore 1313"
  description: "Comprehensive analytics explore joining base view_03940 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_03940
  
  always_filter: {
    filters: [view_03940.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03940.created_at_date: "7 days"]
    unless: [view_03940.id, view_03940.status]
  }

  join: view_03942 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03940.user_id} = ${view_03942.id} ;;
    required_joins: []
  }

  join: view_03943 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03940.account_id} = ${view_03943.account_id} ;;
    required_joins: [view_03942]
  }

  join: view_03944 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03940.category} = ${view_03944.category} ;;
  }

  access_filter: {
    field: view_03940.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03940.is_deleted} = false ;;
}
