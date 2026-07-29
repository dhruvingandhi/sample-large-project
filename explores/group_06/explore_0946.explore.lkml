# Explore: explore_0946
# Auto-generated LookML Explore File

include: "/views/domain_39/view_02839.view.lkml"
include: "/views/domain_41/view_02841.view.lkml"
include: "/views/domain_42/view_02842.view.lkml"
include: "/views/domain_43/view_02843.view.lkml"

explore: explore_0946 {
  label: "Explore Explore 0946"
  description: "Comprehensive analytics explore joining base view_02839 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_02839
  
  always_filter: {
    filters: [view_02839.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02839.created_at_date: "7 days"]
    unless: [view_02839.id, view_02839.status]
  }

  join: view_02841 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02839.user_id} = ${view_02841.id} ;;
    required_joins: []
  }

  join: view_02842 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02839.account_id} = ${view_02842.account_id} ;;
    required_joins: [view_02841]
  }

  join: view_02843 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02839.category} = ${view_02843.category} ;;
  }

  access_filter: {
    field: view_02839.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02839.is_deleted} = false ;;
}
