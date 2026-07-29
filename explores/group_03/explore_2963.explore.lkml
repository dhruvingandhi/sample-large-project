# Explore: explore_2963
# Auto-generated LookML Explore File

include: "/views/domain_40/view_08890.view.lkml"
include: "/views/domain_42/view_08892.view.lkml"
include: "/views/domain_43/view_08893.view.lkml"
include: "/views/domain_44/view_08894.view.lkml"

explore: explore_2963 {
  label: "Explore Explore 2963"
  description: "Comprehensive analytics explore joining base view_08890 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_08890
  
  always_filter: {
    filters: [view_08890.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08890.created_at_date: "7 days"]
    unless: [view_08890.id, view_08890.status]
  }

  join: view_08892 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08890.user_id} = ${view_08892.id} ;;
    required_joins: []
  }

  join: view_08893 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08890.account_id} = ${view_08893.account_id} ;;
    required_joins: [view_08892]
  }

  join: view_08894 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08890.category} = ${view_08894.category} ;;
  }

  access_filter: {
    field: view_08890.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08890.is_deleted} = false ;;
}
