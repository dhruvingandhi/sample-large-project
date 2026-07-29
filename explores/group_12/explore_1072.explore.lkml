# Explore: explore_1072
# Auto-generated LookML Explore File

include: "/views/domain_17/view_03217.view.lkml"
include: "/views/domain_19/view_03219.view.lkml"
include: "/views/domain_20/view_03220.view.lkml"
include: "/views/domain_21/view_03221.view.lkml"

explore: explore_1072 {
  label: "Explore Explore 1072"
  description: "Comprehensive analytics explore joining base view_03217 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03217
  
  always_filter: {
    filters: [view_03217.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03217.created_at_date: "7 days"]
    unless: [view_03217.id, view_03217.status]
  }

  join: view_03219 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03217.user_id} = ${view_03219.id} ;;
    required_joins: []
  }

  join: view_03220 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03217.account_id} = ${view_03220.account_id} ;;
    required_joins: [view_03219]
  }

  join: view_03221 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03217.category} = ${view_03221.category} ;;
  }

  access_filter: {
    field: view_03217.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03217.is_deleted} = false ;;
}
