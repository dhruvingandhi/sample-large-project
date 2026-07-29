# Explore: explore_1062
# Auto-generated LookML Explore File

include: "/views/domain_37/view_03187.view.lkml"
include: "/views/domain_39/view_03189.view.lkml"
include: "/views/domain_40/view_03190.view.lkml"
include: "/views/domain_41/view_03191.view.lkml"

explore: explore_1062 {
  label: "Explore Explore 1062"
  description: "Comprehensive analytics explore joining base view_03187 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03187
  
  always_filter: {
    filters: [view_03187.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03187.created_at_date: "7 days"]
    unless: [view_03187.id, view_03187.status]
  }

  join: view_03189 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03187.user_id} = ${view_03189.id} ;;
    required_joins: []
  }

  join: view_03190 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03187.account_id} = ${view_03190.account_id} ;;
    required_joins: [view_03189]
  }

  join: view_03191 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03187.category} = ${view_03191.category} ;;
  }

  access_filter: {
    field: view_03187.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03187.is_deleted} = false ;;
}
