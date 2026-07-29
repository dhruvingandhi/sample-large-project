# Explore: explore_3828
# Auto-generated LookML Explore File

include: "/views/domain_35/view_11485.view.lkml"
include: "/views/domain_37/view_11487.view.lkml"
include: "/views/domain_38/view_11488.view.lkml"
include: "/views/domain_39/view_11489.view.lkml"

explore: explore_3828 {
  label: "Explore Explore 3828"
  description: "Comprehensive analytics explore joining base view_11485 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11485
  
  always_filter: {
    filters: [view_11485.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11485.created_at_date: "7 days"]
    unless: [view_11485.id, view_11485.status]
  }

  join: view_11487 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11485.user_id} = ${view_11487.id} ;;
    required_joins: []
  }

  join: view_11488 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11485.account_id} = ${view_11488.account_id} ;;
    required_joins: [view_11487]
  }

  join: view_11489 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11485.category} = ${view_11489.category} ;;
  }

  access_filter: {
    field: view_11485.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11485.is_deleted} = false ;;
}
