# Explore: explore_0846
# Auto-generated LookML Explore File

include: "/views/domain_39/view_02539.view.lkml"
include: "/views/domain_41/view_02541.view.lkml"
include: "/views/domain_42/view_02542.view.lkml"
include: "/views/domain_43/view_02543.view.lkml"

explore: explore_0846 {
  label: "Explore Explore 0846"
  description: "Comprehensive analytics explore joining base view_02539 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_02539
  
  always_filter: {
    filters: [view_02539.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02539.created_at_date: "7 days"]
    unless: [view_02539.id, view_02539.status]
  }

  join: view_02541 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02539.user_id} = ${view_02541.id} ;;
    required_joins: []
  }

  join: view_02542 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02539.account_id} = ${view_02542.account_id} ;;
    required_joins: [view_02541]
  }

  join: view_02543 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02539.category} = ${view_02543.category} ;;
  }

  access_filter: {
    field: view_02539.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02539.is_deleted} = false ;;
}
