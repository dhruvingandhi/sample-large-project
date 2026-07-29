# Explore: explore_1514
# Auto-generated LookML Explore File

include: "/views/domain_43/view_04543.view.lkml"
include: "/views/domain_45/view_04545.view.lkml"
include: "/views/domain_46/view_04546.view.lkml"
include: "/views/domain_47/view_04547.view.lkml"

explore: explore_1514 {
  label: "Explore Explore 1514"
  description: "Comprehensive analytics explore joining base view_04543 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04543
  
  always_filter: {
    filters: [view_04543.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04543.created_at_date: "7 days"]
    unless: [view_04543.id, view_04543.status]
  }

  join: view_04545 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04543.user_id} = ${view_04545.id} ;;
    required_joins: []
  }

  join: view_04546 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04543.account_id} = ${view_04546.account_id} ;;
    required_joins: [view_04545]
  }

  join: view_04547 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04543.category} = ${view_04547.category} ;;
  }

  access_filter: {
    field: view_04543.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04543.is_deleted} = false ;;
}
