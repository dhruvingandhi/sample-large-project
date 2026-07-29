# Explore: explore_1713
# Auto-generated LookML Explore File

include: "/views/domain_40/view_05140.view.lkml"
include: "/views/domain_42/view_05142.view.lkml"
include: "/views/domain_43/view_05143.view.lkml"
include: "/views/domain_44/view_05144.view.lkml"

explore: explore_1713 {
  label: "Explore Explore 1713"
  description: "Comprehensive analytics explore joining base view_05140 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05140
  
  always_filter: {
    filters: [view_05140.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05140.created_at_date: "7 days"]
    unless: [view_05140.id, view_05140.status]
  }

  join: view_05142 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05140.user_id} = ${view_05142.id} ;;
    required_joins: []
  }

  join: view_05143 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05140.account_id} = ${view_05143.account_id} ;;
    required_joins: [view_05142]
  }

  join: view_05144 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05140.category} = ${view_05144.category} ;;
  }

  access_filter: {
    field: view_05140.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05140.is_deleted} = false ;;
}
