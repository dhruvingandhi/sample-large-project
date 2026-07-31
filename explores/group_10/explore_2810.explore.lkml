# Update for 2000 file diff target
# Explore: explore_2810
# Auto-generated LookML Explore File

include: "/views/domain_31/view_08431.view.lkml"
include: "/views/domain_33/view_08433.view.lkml"
include: "/views/domain_34/view_08434.view.lkml"
include: "/views/domain_35/view_08435.view.lkml"

explore: explore_2810 {
  label: "Explore Explore 2810"
  description: "Comprehensive analytics explore joining base view_08431 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_08431
  
  always_filter: {
    filters: [view_08431.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08431.created_at_date: "7 days"]
    unless: [view_08431.id, view_08431.status]
  }

  join: view_08433 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08431.user_id} = ${view_08433.id} ;;
    required_joins: []
  }

  join: view_08434 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08431.account_id} = ${view_08434.account_id} ;;
    required_joins: [view_08433]
  }

  join: view_08435 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08431.category} = ${view_08435.category} ;;
  }

  access_filter: {
    field: view_08431.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08431.is_deleted} = false ;;
}
