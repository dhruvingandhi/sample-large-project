# Explore: explore_3062
# Auto-generated LookML Explore File

include: "/views/domain_37/view_09187.view.lkml"
include: "/views/domain_39/view_09189.view.lkml"
include: "/views/domain_40/view_09190.view.lkml"
include: "/views/domain_41/view_09191.view.lkml"

explore: explore_3062 {
  label: "Explore Explore 3062"
  description: "Comprehensive analytics explore joining base view_09187 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09187
  
  always_filter: {
    filters: [view_09187.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09187.created_at_date: "7 days"]
    unless: [view_09187.id, view_09187.status]
  }

  join: view_09189 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09187.user_id} = ${view_09189.id} ;;
    required_joins: []
  }

  join: view_09190 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09187.account_id} = ${view_09190.account_id} ;;
    required_joins: [view_09189]
  }

  join: view_09191 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09187.category} = ${view_09191.category} ;;
  }

  access_filter: {
    field: view_09187.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09187.is_deleted} = false ;;
}
