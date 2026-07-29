# Explore: explore_1345
# Auto-generated LookML Explore File

include: "/views/domain_36/view_04036.view.lkml"
include: "/views/domain_38/view_04038.view.lkml"
include: "/views/domain_39/view_04039.view.lkml"
include: "/views/domain_40/view_04040.view.lkml"

explore: explore_1345 {
  label: "Explore Explore 1345"
  description: "Comprehensive analytics explore joining base view_04036 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04036
  
  always_filter: {
    filters: [view_04036.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04036.created_at_date: "7 days"]
    unless: [view_04036.id, view_04036.status]
  }

  join: view_04038 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04036.user_id} = ${view_04038.id} ;;
    required_joins: []
  }

  join: view_04039 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04036.account_id} = ${view_04039.account_id} ;;
    required_joins: [view_04038]
  }

  join: view_04040 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04036.category} = ${view_04040.category} ;;
  }

  access_filter: {
    field: view_04036.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04036.is_deleted} = false ;;
}
