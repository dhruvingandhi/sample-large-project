# Explore: explore_1006
# Auto-generated LookML Explore File

include: "/views/domain_19/view_03019.view.lkml"
include: "/views/domain_21/view_03021.view.lkml"
include: "/views/domain_22/view_03022.view.lkml"
include: "/views/domain_23/view_03023.view.lkml"

explore: explore_1006 {
  label: "Explore Explore 1006"
  description: "Comprehensive analytics explore joining base view_03019 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_03019
  
  always_filter: {
    filters: [view_03019.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03019.created_at_date: "7 days"]
    unless: [view_03019.id, view_03019.status]
  }

  join: view_03021 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03019.user_id} = ${view_03021.id} ;;
    required_joins: []
  }

  join: view_03022 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03019.account_id} = ${view_03022.account_id} ;;
    required_joins: [view_03021]
  }

  join: view_03023 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03019.category} = ${view_03023.category} ;;
  }

  access_filter: {
    field: view_03019.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03019.is_deleted} = false ;;
}
