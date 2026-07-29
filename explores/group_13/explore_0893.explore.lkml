# Explore: explore_0893
# Auto-generated LookML Explore File

include: "/views/domain_30/view_02680.view.lkml"
include: "/views/domain_32/view_02682.view.lkml"
include: "/views/domain_33/view_02683.view.lkml"
include: "/views/domain_34/view_02684.view.lkml"

explore: explore_0893 {
  label: "Explore Explore 0893"
  description: "Comprehensive analytics explore joining base view_02680 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02680
  
  always_filter: {
    filters: [view_02680.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02680.created_at_date: "7 days"]
    unless: [view_02680.id, view_02680.status]
  }

  join: view_02682 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02680.user_id} = ${view_02682.id} ;;
    required_joins: []
  }

  join: view_02683 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02680.account_id} = ${view_02683.account_id} ;;
    required_joins: [view_02682]
  }

  join: view_02684 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02680.category} = ${view_02684.category} ;;
  }

  access_filter: {
    field: view_02680.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02680.is_deleted} = false ;;
}
