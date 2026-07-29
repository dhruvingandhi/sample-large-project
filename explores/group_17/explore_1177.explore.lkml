# Explore: explore_1177
# Auto-generated LookML Explore File

include: "/views/domain_32/view_03532.view.lkml"
include: "/views/domain_34/view_03534.view.lkml"
include: "/views/domain_35/view_03535.view.lkml"
include: "/views/domain_36/view_03536.view.lkml"

explore: explore_1177 {
  label: "Explore Explore 1177"
  description: "Comprehensive analytics explore joining base view_03532 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03532
  
  always_filter: {
    filters: [view_03532.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03532.created_at_date: "7 days"]
    unless: [view_03532.id, view_03532.status]
  }

  join: view_03534 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03532.user_id} = ${view_03534.id} ;;
    required_joins: []
  }

  join: view_03535 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03532.account_id} = ${view_03535.account_id} ;;
    required_joins: [view_03534]
  }

  join: view_03536 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03532.category} = ${view_03536.category} ;;
  }

  access_filter: {
    field: view_03532.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03532.is_deleted} = false ;;
}
