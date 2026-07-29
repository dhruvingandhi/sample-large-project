# Explore: explore_2729
# Auto-generated LookML Explore File

include: "/views/domain_38/view_08188.view.lkml"
include: "/views/domain_40/view_08190.view.lkml"
include: "/views/domain_41/view_08191.view.lkml"
include: "/views/domain_42/view_08192.view.lkml"

explore: explore_2729 {
  label: "Explore Explore 2729"
  description: "Comprehensive analytics explore joining base view_08188 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08188
  
  always_filter: {
    filters: [view_08188.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08188.created_at_date: "7 days"]
    unless: [view_08188.id, view_08188.status]
  }

  join: view_08190 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08188.user_id} = ${view_08190.id} ;;
    required_joins: []
  }

  join: view_08191 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08188.account_id} = ${view_08191.account_id} ;;
    required_joins: [view_08190]
  }

  join: view_08192 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08188.category} = ${view_08192.category} ;;
  }

  access_filter: {
    field: view_08188.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08188.is_deleted} = false ;;
}
