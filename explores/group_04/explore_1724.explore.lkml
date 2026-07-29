# Explore: explore_1724
# Auto-generated LookML Explore File

include: "/views/domain_23/view_05173.view.lkml"
include: "/views/domain_25/view_05175.view.lkml"
include: "/views/domain_26/view_05176.view.lkml"
include: "/views/domain_27/view_05177.view.lkml"

explore: explore_1724 {
  label: "Explore Explore 1724"
  description: "Comprehensive analytics explore joining base view_05173 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_05173
  
  always_filter: {
    filters: [view_05173.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05173.created_at_date: "7 days"]
    unless: [view_05173.id, view_05173.status]
  }

  join: view_05175 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05173.user_id} = ${view_05175.id} ;;
    required_joins: []
  }

  join: view_05176 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05173.account_id} = ${view_05176.account_id} ;;
    required_joins: [view_05175]
  }

  join: view_05177 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05173.category} = ${view_05177.category} ;;
  }

  access_filter: {
    field: view_05173.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05173.is_deleted} = false ;;
}
