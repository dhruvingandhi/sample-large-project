# Explore: explore_3730
# Auto-generated LookML Explore File

include: "/views/domain_41/view_11191.view.lkml"
include: "/views/domain_43/view_11193.view.lkml"
include: "/views/domain_44/view_11194.view.lkml"
include: "/views/domain_45/view_11195.view.lkml"

explore: explore_3730 {
  label: "Explore Explore 3730"
  description: "Comprehensive analytics explore joining base view_11191 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11191
  
  always_filter: {
    filters: [view_11191.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11191.created_at_date: "7 days"]
    unless: [view_11191.id, view_11191.status]
  }

  join: view_11193 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11191.user_id} = ${view_11193.id} ;;
    required_joins: []
  }

  join: view_11194 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11191.account_id} = ${view_11194.account_id} ;;
    required_joins: [view_11193]
  }

  join: view_11195 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11191.category} = ${view_11195.category} ;;
  }

  access_filter: {
    field: view_11191.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11191.is_deleted} = false ;;
}
