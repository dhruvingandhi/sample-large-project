# Explore: explore_1796
# Auto-generated LookML Explore File

include: "/views/domain_39/view_05389.view.lkml"
include: "/views/domain_41/view_05391.view.lkml"
include: "/views/domain_42/view_05392.view.lkml"
include: "/views/domain_43/view_05393.view.lkml"

explore: explore_1796 {
  label: "Explore Explore 1796"
  description: "Comprehensive analytics explore joining base view_05389 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05389
  
  always_filter: {
    filters: [view_05389.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05389.created_at_date: "7 days"]
    unless: [view_05389.id, view_05389.status]
  }

  join: view_05391 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05389.user_id} = ${view_05391.id} ;;
    required_joins: []
  }

  join: view_05392 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05389.account_id} = ${view_05392.account_id} ;;
    required_joins: [view_05391]
  }

  join: view_05393 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05389.category} = ${view_05393.category} ;;
  }

  access_filter: {
    field: view_05389.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05389.is_deleted} = false ;;
}
