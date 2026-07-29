# Explore: explore_1413
# Auto-generated LookML Explore File

include: "/views/domain_40/view_04240.view.lkml"
include: "/views/domain_42/view_04242.view.lkml"
include: "/views/domain_43/view_04243.view.lkml"
include: "/views/domain_44/view_04244.view.lkml"

explore: explore_1413 {
  label: "Explore Explore 1413"
  description: "Comprehensive analytics explore joining base view_04240 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04240
  
  always_filter: {
    filters: [view_04240.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04240.created_at_date: "7 days"]
    unless: [view_04240.id, view_04240.status]
  }

  join: view_04242 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04240.user_id} = ${view_04242.id} ;;
    required_joins: []
  }

  join: view_04243 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04240.account_id} = ${view_04243.account_id} ;;
    required_joins: [view_04242]
  }

  join: view_04244 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04240.category} = ${view_04244.category} ;;
  }

  access_filter: {
    field: view_04240.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04240.is_deleted} = false ;;
}
