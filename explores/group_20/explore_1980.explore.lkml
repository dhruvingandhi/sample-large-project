# Explore: explore_1980
# Auto-generated LookML Explore File

include: "/views/domain_41/view_05941.view.lkml"
include: "/views/domain_43/view_05943.view.lkml"
include: "/views/domain_44/view_05944.view.lkml"
include: "/views/domain_45/view_05945.view.lkml"

explore: explore_1980 {
  label: "Explore Explore 1980"
  description: "Comprehensive analytics explore joining base view_05941 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05941
  
  always_filter: {
    filters: [view_05941.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05941.created_at_date: "7 days"]
    unless: [view_05941.id, view_05941.status]
  }

  join: view_05943 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05941.user_id} = ${view_05943.id} ;;
    required_joins: []
  }

  join: view_05944 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05941.account_id} = ${view_05944.account_id} ;;
    required_joins: [view_05943]
  }

  join: view_05945 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05941.category} = ${view_05945.category} ;;
  }

  access_filter: {
    field: view_05941.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05941.is_deleted} = false ;;
}
