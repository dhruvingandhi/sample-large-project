# Explore: explore_3946
# Auto-generated LookML Explore File

include: "/views/domain_39/view_11839.view.lkml"
include: "/views/domain_41/view_11841.view.lkml"
include: "/views/domain_42/view_11842.view.lkml"
include: "/views/domain_43/view_11843.view.lkml"

explore: explore_3946 {
  label: "Explore Explore 3946"
  description: "Comprehensive analytics explore joining base view_11839 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11839
  
  always_filter: {
    filters: [view_11839.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11839.created_at_date: "7 days"]
    unless: [view_11839.id, view_11839.status]
  }

  join: view_11841 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11839.user_id} = ${view_11841.id} ;;
    required_joins: []
  }

  join: view_11842 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11839.account_id} = ${view_11842.account_id} ;;
    required_joins: [view_11841]
  }

  join: view_11843 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11839.category} = ${view_11843.category} ;;
  }

  access_filter: {
    field: view_11839.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11839.is_deleted} = false ;;
}
