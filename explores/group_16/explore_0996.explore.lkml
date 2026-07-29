# Explore: explore_0996
# Auto-generated LookML Explore File

include: "/views/domain_39/view_02989.view.lkml"
include: "/views/domain_41/view_02991.view.lkml"
include: "/views/domain_42/view_02992.view.lkml"
include: "/views/domain_43/view_02993.view.lkml"

explore: explore_0996 {
  label: "Explore Explore 0996"
  description: "Comprehensive analytics explore joining base view_02989 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_02989
  
  always_filter: {
    filters: [view_02989.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02989.created_at_date: "7 days"]
    unless: [view_02989.id, view_02989.status]
  }

  join: view_02991 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02989.user_id} = ${view_02991.id} ;;
    required_joins: []
  }

  join: view_02992 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02989.account_id} = ${view_02992.account_id} ;;
    required_joins: [view_02991]
  }

  join: view_02993 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02989.category} = ${view_02993.category} ;;
  }

  access_filter: {
    field: view_02989.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02989.is_deleted} = false ;;
}
