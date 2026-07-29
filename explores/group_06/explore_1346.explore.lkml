# Explore: explore_1346
# Auto-generated LookML Explore File

include: "/views/domain_39/view_04039.view.lkml"
include: "/views/domain_41/view_04041.view.lkml"
include: "/views/domain_42/view_04042.view.lkml"
include: "/views/domain_43/view_04043.view.lkml"

explore: explore_1346 {
  label: "Explore Explore 1346"
  description: "Comprehensive analytics explore joining base view_04039 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04039
  
  always_filter: {
    filters: [view_04039.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04039.created_at_date: "7 days"]
    unless: [view_04039.id, view_04039.status]
  }

  join: view_04041 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04039.user_id} = ${view_04041.id} ;;
    required_joins: []
  }

  join: view_04042 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04039.account_id} = ${view_04042.account_id} ;;
    required_joins: [view_04041]
  }

  join: view_04043 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04039.category} = ${view_04043.category} ;;
  }

  access_filter: {
    field: view_04039.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04039.is_deleted} = false ;;
}
