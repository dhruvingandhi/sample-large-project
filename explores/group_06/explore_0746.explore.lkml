# Explore: explore_0746
# Auto-generated LookML Explore File

include: "/views/domain_39/view_02239.view.lkml"
include: "/views/domain_41/view_02241.view.lkml"
include: "/views/domain_42/view_02242.view.lkml"
include: "/views/domain_43/view_02243.view.lkml"

explore: explore_0746 {
  label: "Explore Explore 0746"
  description: "Comprehensive analytics explore joining base view_02239 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_02239
  
  always_filter: {
    filters: [view_02239.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02239.created_at_date: "7 days"]
    unless: [view_02239.id, view_02239.status]
  }

  join: view_02241 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02239.user_id} = ${view_02241.id} ;;
    required_joins: []
  }

  join: view_02242 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02239.account_id} = ${view_02242.account_id} ;;
    required_joins: [view_02241]
  }

  join: view_02243 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02239.category} = ${view_02243.category} ;;
  }

  access_filter: {
    field: view_02239.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02239.is_deleted} = false ;;
}
