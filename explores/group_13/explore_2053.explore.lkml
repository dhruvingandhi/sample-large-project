# Explore: explore_2053
# Auto-generated LookML Explore File

include: "/views/domain_10/view_06160.view.lkml"
include: "/views/domain_12/view_06162.view.lkml"
include: "/views/domain_13/view_06163.view.lkml"
include: "/views/domain_14/view_06164.view.lkml"

explore: explore_2053 {
  label: "Explore Explore 2053"
  description: "Comprehensive analytics explore joining base view_06160 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06160
  
  always_filter: {
    filters: [view_06160.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06160.created_at_date: "7 days"]
    unless: [view_06160.id, view_06160.status]
  }

  join: view_06162 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06160.user_id} = ${view_06162.id} ;;
    required_joins: []
  }

  join: view_06163 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06160.account_id} = ${view_06163.account_id} ;;
    required_joins: [view_06162]
  }

  join: view_06164 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06160.category} = ${view_06164.category} ;;
  }

  access_filter: {
    field: view_06160.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06160.is_deleted} = false ;;
}
