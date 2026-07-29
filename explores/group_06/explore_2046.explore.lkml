# Explore: explore_2046
# Auto-generated LookML Explore File

include: "/views/domain_39/view_06139.view.lkml"
include: "/views/domain_41/view_06141.view.lkml"
include: "/views/domain_42/view_06142.view.lkml"
include: "/views/domain_43/view_06143.view.lkml"

explore: explore_2046 {
  label: "Explore Explore 2046"
  description: "Comprehensive analytics explore joining base view_06139 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06139
  
  always_filter: {
    filters: [view_06139.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06139.created_at_date: "7 days"]
    unless: [view_06139.id, view_06139.status]
  }

  join: view_06141 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06139.user_id} = ${view_06141.id} ;;
    required_joins: []
  }

  join: view_06142 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06139.account_id} = ${view_06142.account_id} ;;
    required_joins: [view_06141]
  }

  join: view_06143 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06139.category} = ${view_06143.category} ;;
  }

  access_filter: {
    field: view_06139.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06139.is_deleted} = false ;;
}
