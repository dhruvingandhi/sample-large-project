# Explore: explore_0730
# Auto-generated LookML Explore File

include: "/views/domain_41/view_02191.view.lkml"
include: "/views/domain_43/view_02193.view.lkml"
include: "/views/domain_44/view_02194.view.lkml"
include: "/views/domain_45/view_02195.view.lkml"

explore: explore_0730 {
  label: "Explore Explore 0730"
  description: "Comprehensive analytics explore joining base view_02191 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02191
  
  always_filter: {
    filters: [view_02191.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02191.created_at_date: "7 days"]
    unless: [view_02191.id, view_02191.status]
  }

  join: view_02193 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02191.user_id} = ${view_02193.id} ;;
    required_joins: []
  }

  join: view_02194 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02191.account_id} = ${view_02194.account_id} ;;
    required_joins: [view_02193]
  }

  join: view_02195 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02191.category} = ${view_02195.category} ;;
  }

  access_filter: {
    field: view_02191.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02191.is_deleted} = false ;;
}
