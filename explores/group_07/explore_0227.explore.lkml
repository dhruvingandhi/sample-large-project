# Explore: explore_0227
# Auto-generated LookML Explore File

include: "/views/domain_32/view_00682.view.lkml"
include: "/views/domain_34/view_00684.view.lkml"
include: "/views/domain_35/view_00685.view.lkml"
include: "/views/domain_36/view_00686.view.lkml"

explore: explore_0227 {
  label: "Explore Explore 0227"
  description: "Comprehensive analytics explore joining base view_00682 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00682
  
  always_filter: {
    filters: [view_00682.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00682.created_at_date: "7 days"]
    unless: [view_00682.id, view_00682.status]
  }

  join: view_00684 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00682.user_id} = ${view_00684.id} ;;
    required_joins: []
  }

  join: view_00685 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00682.account_id} = ${view_00685.account_id} ;;
    required_joins: [view_00684]
  }

  join: view_00686 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00682.category} = ${view_00686.category} ;;
  }

  access_filter: {
    field: view_00682.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00682.is_deleted} = false ;;
}
