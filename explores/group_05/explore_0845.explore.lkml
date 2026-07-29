# Explore: explore_0845
# Auto-generated LookML Explore File

include: "/views/domain_36/view_02536.view.lkml"
include: "/views/domain_38/view_02538.view.lkml"
include: "/views/domain_39/view_02539.view.lkml"
include: "/views/domain_40/view_02540.view.lkml"

explore: explore_0845 {
  label: "Explore Explore 0845"
  description: "Comprehensive analytics explore joining base view_02536 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_02536
  
  always_filter: {
    filters: [view_02536.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02536.created_at_date: "7 days"]
    unless: [view_02536.id, view_02536.status]
  }

  join: view_02538 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02536.user_id} = ${view_02538.id} ;;
    required_joins: []
  }

  join: view_02539 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02536.account_id} = ${view_02539.account_id} ;;
    required_joins: [view_02538]
  }

  join: view_02540 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02536.category} = ${view_02540.category} ;;
  }

  access_filter: {
    field: view_02536.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02536.is_deleted} = false ;;
}
