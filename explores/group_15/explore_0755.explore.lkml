# Explore: explore_0755
# Auto-generated LookML Explore File

include: "/views/domain_16/view_02266.view.lkml"
include: "/views/domain_18/view_02268.view.lkml"
include: "/views/domain_19/view_02269.view.lkml"
include: "/views/domain_20/view_02270.view.lkml"

explore: explore_0755 {
  label: "Explore Explore 0755"
  description: "Comprehensive analytics explore joining base view_02266 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_02266
  
  always_filter: {
    filters: [view_02266.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02266.created_at_date: "7 days"]
    unless: [view_02266.id, view_02266.status]
  }

  join: view_02268 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02266.user_id} = ${view_02268.id} ;;
    required_joins: []
  }

  join: view_02269 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02266.account_id} = ${view_02269.account_id} ;;
    required_joins: [view_02268]
  }

  join: view_02270 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02266.category} = ${view_02270.category} ;;
  }

  access_filter: {
    field: view_02266.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02266.is_deleted} = false ;;
}
