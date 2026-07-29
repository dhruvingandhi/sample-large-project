# Explore: explore_3014
# Auto-generated LookML Explore File

include: "/views/domain_43/view_09043.view.lkml"
include: "/views/domain_45/view_09045.view.lkml"
include: "/views/domain_46/view_09046.view.lkml"
include: "/views/domain_47/view_09047.view.lkml"

explore: explore_3014 {
  label: "Explore Explore 3014"
  description: "Comprehensive analytics explore joining base view_09043 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_09043
  
  always_filter: {
    filters: [view_09043.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09043.created_at_date: "7 days"]
    unless: [view_09043.id, view_09043.status]
  }

  join: view_09045 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09043.user_id} = ${view_09045.id} ;;
    required_joins: []
  }

  join: view_09046 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09043.account_id} = ${view_09046.account_id} ;;
    required_joins: [view_09045]
  }

  join: view_09047 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09043.category} = ${view_09047.category} ;;
  }

  access_filter: {
    field: view_09043.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09043.is_deleted} = false ;;
}
