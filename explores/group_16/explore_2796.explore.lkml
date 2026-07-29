# Explore: explore_2796
# Auto-generated LookML Explore File

include: "/views/domain_39/view_08389.view.lkml"
include: "/views/domain_41/view_08391.view.lkml"
include: "/views/domain_42/view_08392.view.lkml"
include: "/views/domain_43/view_08393.view.lkml"

explore: explore_2796 {
  label: "Explore Explore 2796"
  description: "Comprehensive analytics explore joining base view_08389 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_08389
  
  always_filter: {
    filters: [view_08389.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08389.created_at_date: "7 days"]
    unless: [view_08389.id, view_08389.status]
  }

  join: view_08391 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08389.user_id} = ${view_08391.id} ;;
    required_joins: []
  }

  join: view_08392 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08389.account_id} = ${view_08392.account_id} ;;
    required_joins: [view_08391]
  }

  join: view_08393 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08389.category} = ${view_08393.category} ;;
  }

  access_filter: {
    field: view_08389.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08389.is_deleted} = false ;;
}
